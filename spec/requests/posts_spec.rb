require 'rails_helper'

RSpec.describe "Posts API", type: :request do
  let!(:posts) { create_list(:post, 5) }
  let(:post_id) { posts.first.id }

  describe "GET /posts" do
    before { get "/posts" }

    it "return posts list" do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it "returns status 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /posts/:id" do
    before { get "/posts/#{post_id}" }

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
    let(:valid_attributes) { { title: 'Ruby on Rails API', body: 'Post content.', created_by: '1' } }

    context "when request valid" do
      before { post '/posts', params: valid_attributes }

      it "creates a Post" do
        expect(json['title']).to eq('Ruby on Rails API')
      end

      it "returns status 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when request is invalid" do
      before { post '/posts', params: { title: 'Wrong title' } }

      it "returns status 422" do
        expect(response).to have_http_status(422)
      end

      it "returns validation failure message" do
        expect(response.body).to match(/Validation failed: Body can't be blank, Created by can't be blank/)
      end
    end
  end

  describe "PUT /posts/:id" do
    let(:valid_attributes) { { title: 'Valid title' } }

    context "when record exists" do
      before { put "/posts/#{post_id}", params: valid_attributes }

      it "updates record" do
        expect(response.body).to be_empty
      end

      it "returns status 204" do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe "DELETE /posts/:id" do
    before { delete "/posts/#{post_id}" }

    it "returns status 204" do
      expect(response).to have_http_status(204)
    end
  end

end
