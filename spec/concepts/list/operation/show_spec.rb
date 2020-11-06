# frozen_string_literal: true

describe List::Operation::Show, type: :operation do
  let!(:list) { create(:list) }

  context 'when list exists' do
    it 'executes with success' do
      expect(execute_operation).to be_success
    end

    it 'returns lists' do
      result = execute_operation

      expect(result['result']).to be_a List
      expect(result['result'].id).to eq list.id
    end
  end

  context 'when list does NOT exist' do
    it 'executes with failure' do
      expect(execute_operation(id: List.last.id + 1)).to be_failure
    end

    it 'returns nil in result' do
      result = execute_operation(id: List.last.id + 1)

      expect(result['result']).to be_nil
    end
  end

  def execute_operation(id: list.id)
    described_class.call(params: { id: id })
  end
end
