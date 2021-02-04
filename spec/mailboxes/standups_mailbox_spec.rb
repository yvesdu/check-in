require 'rails_helper'
include ActiveJob::TestHelper

RSpec.describe StandupsMailbox, type: :mailbox do
  let(:user) { FactoryBot.create(:user) }
  let(:to_email) { "standups.#{user.id}@app.buildasaasappinrails.com" }
  let(:body) do
    %Q(
      [d] Did a thing
      [d] And Another
      [t] Something to do
      [b] Something in the way. Some really long line about something or another

      ##- Please type your reply above this line -##
    )
  end

  subject do
    receive_inbound_email_from_mail(
      from: user.email,
      to: to_email,
      subject: 'Re: Reminder',
      body: body
    )
  end

  before do
    ActiveJob::Base.queue_adapter = :test
  end

  it 'saves standup record' do
    expect { subject }.to change(Standup, :count).by(1)
  end

  it 'saves task records' do
    expect { subject }.to change(Task, :count).by(4)
  end

  context 'fails on bad to email' do
    let(:to_email) {"standups@app.buildasaasappinrails.com"}

    it 'does not save standup record' do
      expect { subject rescue nil }.to_not change(Standup, :count)
    end
  end

  context 'fails on no user' do
    let(:to_email) {"standups.9a859af8-30ca-4473-b073-47105352d936@app.buildasaasappinrails.com"}

    it 'does not save standup record' do
      expect { subject rescue nil }.to_not change(Standup, :count)
    end
  end

  context 'fails on useless body' do
    let(:body) { 'asdj;oisaduaskd' }

    it 'does not save standup record' do
      expect { subject rescue nil }.to_not change(Standup, :count)
    end
  end

  context 'fails on empty body' do
    let(:body) { '' }

    it 'does not save standup record' do
      expect { subject rescue nil }.to_not change(Standup, :count)
    end
  end
end
