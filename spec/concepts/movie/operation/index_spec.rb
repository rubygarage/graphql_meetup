# frozen_string_literal: true

describe Movie::Operation::Index, type: :operation do
  let(:movies_count) { 2 }
  let(:movies) { create_list :movie, movies_count }

  context 'when movies exist' do
    before { movies }

    it 'executes with success' do
      expect(execute_operation).to be_success
    end

    it 'returns movies' do
      result = execute_operation

      expect(result['result']).to all(be_a Movie)
      expect(result['result'].count).to eq movies_count
    end
  end

  context 'when movies do NOT exist' do
    it 'executes with success' do
      expect(execute_operation).to be_success
    end

    it 'returns an empty array' do
      result = execute_operation

      expect(result['result']).to be_empty
    end
  end

  def execute_operation
    described_class.call
  end
end
