require 'spec_helper'

describe Guard::Reek do
  subject { reek }
  let(:guard) { described_class.new }

  before do
    Guard::Notifier.stub :notify

    Guard::UI.stub :info
    Guard::UI.stub :error
  end

  describe "#start" do
    subject(:start) { guard.start }

    it "runs all" do
      guard.should_receive :run_all

      start
    end
  end

  describe "#run_all" do
    subject(:run_all) { guard.run_all }

    it "runs reek" do
      guard.should_receive(:reek)
    end
  end
end
