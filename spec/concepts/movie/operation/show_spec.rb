# frozen_string_literal: true

describe Movie::Operation::Show, type: :operation do
  let(:movie) { create :movie }

  before { movie }

  context 'when movie exists' do
    it 'executes with success' do
      expect(execute_operation).to be_success
    end

    it 'returns movies' do
      result = execute_operation

      expect(result['result']).to be_a Movie
      expect(result['result'].id).to eq movie.id
    end
  end

  context 'when movie does NOT exist' do
    it 'executes with failure' do
      expect(execute_operation(id: Movie.last.id + 1)).to be_failure
    end

    it 'returns nil in result' do
      result = execute_operation(id: Movie.last.id + 1)

      expect(result['result']).to be_nil
    end
  end

  def execute_operation(id: movie.id)
    described_class.call(params: { id: id })
  end
end
