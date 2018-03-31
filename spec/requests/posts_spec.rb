require 'rails_helper'

RSpec.describe "Posts API", type: :request do
  let(:user) { create(:user) }
  let!(:posts) { create_list(:post, 5, created_by: user.id) }
  let(:post_id) { posts.first.id }
  let(:headers) { valid_headers }

  describe "GET /posts" do
    before { get "/posts", params: {}, headers: headers }

    it "return posts list" do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it "returns status 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /posts/:id" do
    before { get "/posts/#{post_id}", params: {}, headers: headers }

    context "when record exists" do
      it "returns post" do
        expect(json).not_to be_empty
        expect(json["id"]).to eq(post_id)
      end

      it "returns status 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when post not exist" do
      let(:post_id) { 10 }

      it "returns status 404" do
        expect(response).to have_http_status(404)
      end

      it "returns not found messahe" do
        expect(response.body).to match(/Couldn't find Post/)
      end
    end
  end

  describe "POST /posts" do
    let(:valid_attributes) {
      { title: 'Ruby on Rails API', body: 'Post content.', created_by: user.id.to_s }.to_json
    }

    context "when request valid" do
      before { post '/posts', params: valid_attributes, headers: headers }

      it "creates a Post" do
        expect(json['title']).to eq('Ruby on Rails API')
      end

      it "returns status 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when request is invalid" do
      let(:invalid_attributes) { { body: nil }.to_json }
      before { post '/posts', params: invalid_attributes, headers: headers }

      it "returns status 422" do
        expect(response).to have_http_status(422)
      end

      it "returns validation failure message" do
        expect(json['message']).to match(/Validation failed: Title can't be blank, Body can't be blank/)
      end
    end
  end

  describe "PUT /posts/:id" do
    let(:valid_attributes) { { title: 'Valid title' }.to_json }

    context "when record exists" do
      before { put "/posts/#{post_id}", params: valid_attributes, headers: headers }

      it "updates record" do
        expect(response.body).to be_empty
      end

      it "returns status 204" do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe "DELETE /posts/:id" do
    before { delete "/posts/#{post_id}", params: {}, headers: headers }

    it "returns status 204" do
      expect(response).to have_http_status(204)
    end
  end

end
