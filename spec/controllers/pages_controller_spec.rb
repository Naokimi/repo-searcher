require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe '#home' do
    subject { get :home, params: { query: query } }

    context 'with query' do
      let(:query) { 'query' }

      it 'calls the GithubService and renders repos' do
        expect(GithubCallerService).to receive(:call).and_return({ 'total_count' => 1 })
        subject
      end
    end

    context 'without query' do
      let(:query) { nil }

      it 'skips the GithubService' do
        expect(GithubCallerService).not_to receive(:call)
        subject
      end
    end
  end
end
