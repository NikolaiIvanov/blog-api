require 'rails_helper'

RSpec.describe 'Comments API', type: :request do
  let!(:topic) { create(:post) }
  let!(:comments) { create_list(:comment, 5, post_id: topic.id) }
  let(:post_id) { topic.id }
  let(:id) { comments.first.id }

  describe 'GET /posts/:post_id/comments' do
    before { get "/posts/#{post_id}/comments" }

    context 'when post exists' do
      it 'returns status 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all post comments' do
        expect(json.size).to eq(5)
      end
    end

    context 'when post does not exist' do
      let(:post_id) { 0 }

      it 'returns status 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns not found message' do
        expect(response.body).to match(/Couldn't find Post with 'id'=0/)
      end
    end
  end

  describe 'GET /posts/:post_id/comments/:id' do
    before { get "/posts/#{post_id}/comments/#{id}" }

    context 'when post comment exists' do
      it 'returns status 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns single comment' do
        expect(json['id']).to eq(id)
      end

      it 'returns post comment' do
        expect(json['post_id']).to eq(post_id)
      end
    end

    context 'when post comment not exist' do
      let(:id) { 0 }

      it 'returns status 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns not found message' do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  describe 'POST /posts/#{post_id}/comments' do
    let(:valid_attributes) { { name: 'John Doe', body: 'Comment body' } }

    context 'when request attributes valid' do
      before { post "/posts/#{post_id}/comments", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when invalid request' do
      before { post "/posts/#{post_id}/comments", params: {} }

      it 'returns status 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank, Body can't be blank/)
      end
    end
  end

  describe 'PUT /posts/:post_id/comments/:id' do
    let(:valid_attributes) { { name: 'John', body: 'Comment body' } }
    before { put "/posts/#{post_id}/comments/#{id}", params: valid_attributes }

    context 'when comment exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates comment' do
        updated_comment = Comment.find(id)
        expect(updated_comment.name).to match(/John/)
      end
    end

    context 'when the comment does not exist' do
      let(:id) { 0 }

      it 'returns status 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  describe 'DELETE /posts/:id' do
    before { delete "/posts/#{post_id}/comments/#{id}" }

    it 'returns status 204' do
      expect(response).to have_http_status(204)
    end
  end
end
