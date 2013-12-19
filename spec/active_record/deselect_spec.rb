require 'spec_helper'

ActiveRecord::Base.silence_stream(STDOUT) do
  ActiveRecord::Schema.define do
    create_table :posts do |t|
      t.string   :name
      t.text     :body
    end
  end
end

class Post < ActiveRecord::Base; end

describe ActiveRecord::Deselect do
  describe '#deselect' do
    context 'with select' do
      it { expect(Post.select(:id).deselect(:name).select_values).to eq([:id]) }
      it { expect(Post.select(:id, :name).deselect(:name).select_values).to eq([:id]) }
      it { expect(Post.select(:id, :name, :body).deselect(:name).select_values).to eq([:id, :body]) }
      it { expect(Post.select(:id, :name, :body).deselect(:id, :name).select_values).to eq([:body]) }

      context "with String" do
        it { expect(Post.select('id', :name, :body).deselect(:id, :name).select_values).to eq([:body]) }
      end

      context "with tablename" do
        it { expect(Post.select('posts.id', :name).deselect('posts.id').select_values).to eq([:name]) }
        it { expect(Post.select('posts.id', :name).deselect('id').select_values).to eq([:name]) }
        it { expect(Post.select('posts.id', :name).deselect(:id).select_values).to eq([:name]) }
        it { expect(Post.select(:'posts.id', :name).deselect('id').select_values).to eq([:name]) }
      end
    end

    context "with all" do
      it { expect(Post.all.deselect(:id).select_values).to eq([:name, :body]) }
    end

    context "with model" do
      it { expect(Post.deselect(:id).select_values).to eq([:name, :body]) }
    end

    context "with where" do
      it { expect(Post.where(id: 1).deselect(:id).select_values).to eq([:name, :body]) }
    end
  end
end
