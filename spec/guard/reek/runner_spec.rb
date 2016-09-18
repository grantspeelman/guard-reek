require 'spec_helper'

describe Guard::Reek::Runner do
  subject { Guard::Reek::Runner.new(options) }
  let(:options) { { ui: ui, notifier: notifier } }
  let(:ui) { class_double('Guard::UI', info: true) }
  let(:notifier) { class_double('Guard::Notifier', notify: true) }

  before do
    allow(subject).to receive(:system)
  end

  it 'executes reek' do
    expect(subject).to receive(:system).with('reek')
    subject.run
  end

  it 'executes reek with file' do
    expect(subject).to receive(:system).with('reek', 'test.rb')
    subject.run(['test.rb'])
  end

  it 'executes reek when .reek updated' do
    expect(subject).to receive(:system).with('reek')
    subject.run(['.reek'])
  end

  context 'when reek exited with 0 status' do
    before do
      allow(subject).to receive(:system).and_return(true)
    end

    it 'notifies about success' do
      expect(notifier).to receive(:notify).with('Reek Results', title: 'Passed', image: :success)
      subject.run
    end
  end

  context 'when reek exited with non 0 status' do
    before do
      allow(subject).to receive(:system).and_return(false)
    end

    it 'notifies about failure' do
      expect(notifier).to receive(:notify).with('Reek Results', title: 'Failed', image: :failed)
      subject.run
    end
  end
end
