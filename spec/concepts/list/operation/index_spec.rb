# frozen_string_literal: true

describe List::Operation::Index, type: :operation do

  context 'when lists exist' do
    let(:lists_count) { 2 }
    let!(:lists) { create_list(:list, lists_count) }

    it 'executes with success' do
      expect(execute_operation).to be_success
    end

    it 'returns lists' do
      result = execute_operation

      expect(result['result']).to all(be_a List)
      expect(result['result'].count).to eq lists_count
    end
  end

  context 'when lists do NOT exist' do
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
