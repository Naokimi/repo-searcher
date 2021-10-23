require 'rails_helper'

RSpec.describe GithubCallerService, type: :service do
  subject { GithubCallerService.call('query') }

  before { allow(HTTParty).to receive(:get).and_return(response) }

  context 'success' do
    let(:response) { { 'total_count' => 1, 'incomplete_results' => false, 'items' => ['id' => 1] } }

    it { expect(subject).to eq(response) }
  end

  context 'failure' do
    let(:response) { { 'message' => 'Bad credentials', 'documentation_url' => 'https://docs.github.com/rest' } }

    it { expect(subject).to eq({}) }
  end
end
