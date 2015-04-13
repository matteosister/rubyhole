require 'spec_helper'

describe Rubyhole::RabbitMqManager do
  before :each do
    @conn = double('connection')
    @ch = double('channel')
    allow(@conn).to receive(:create_channel).and_return(@ch)
  end

  subject do
    Rubyhole::RabbitMqManager.new(@conn)
  end

  [ :create_channel, :close_channel, :bind, :subscribe ].each do |method|
    it "should respond to #{method}" do
      expect(subject).to respond_to(method)
    end
  end

  it 'is initialize the connection' do
    expect(subject.conn).not_to be nil
  end

  it 'is initialize the channel to nil' do
    expect(subject.ch).to be nil
  end

  describe 'create_channel' do
    it 'closes channel before opening a new one' do
      expect(subject).to receive(:close_channel).once
      subject.create_channel
    end

    it 'creates a new channel on the rabbit connection' do
      expect(@conn).to receive(:create_channel).once
      subject.create_channel
    end

    it 'returns a new channel' do
      expect(subject.create_channel).to eq @ch
    end
  end
end
