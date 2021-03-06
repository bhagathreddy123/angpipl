require 'rails_helper'

RSpec.describe WordsController, type: :controller do


  describe "GET index" do
  	before { get :index }
  	context 'when some words present' do
	   let!(:word) { create(:word) }
	    it "assigns @words" do
	      expect(assigns(:words)).to eq([word])
	    end
    end

    context 'when no words present' do
	    it "assigns @words" do
	      expect(assigns(:words)).to eq([])
	    end
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end
  end	

  describe "GET #index" do
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
  	before { get :new }
  	it "assigns @word" do
      expect(assigns(:word)).to be_a_new(Word)
  	end
  	it "renders the new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "Post create" do
  	subject { post :create, params: params }
  	context 'valid params' do
  	let(:params) do
  		{ word: { value:"cat", language: 'english'}}
  	end
  	it 'creates new word' do
  		expect {subject}.to change(Word, :count).from(0).to(1)
  	end
  end

  context 'invalid params' do
  	let(:params) do
  		{ word: { value:"cat"}}
  	end
  	it 'does not create new word' do
  		expect {subject}.not_to change(Word, :count)
  	end
  end
end

end
