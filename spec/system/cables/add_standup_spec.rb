require 'rails_helper'

RSpec.describe 'ActionCable Add Standup User', type: :system do
  login_admin

  let(:team) {
    team = FactoryBot.create(
      :team,
      user_ids: [@admin.id],
      has_recap: true,
      recap_time: Time.at(
        Time.now.utc.to_i - (Time.now.utc.to_i % 15.minutes)
      ).utc
    )
    team.update(
      days: [DaysOfTheWeekMembership.new(
        team_id: team.id,
        day: Time.now.utc.strftime('%A').downcase
      )]
    )
    team.users = [@admin]
    team.save
  }

  context 'should see standup added' do
    it 'to users_standups via ActionCable', js: true do
      visit standups_account_user_path(@admin)

      standup_text = 'Oh yeah!'

      expect(page).not_to have_content(standup_text) # sanity check

      # submit form in new window
      new_window = open_new_window
      within_window new_window do
        visit new_standup_path(Date.today.iso8601)
        first('form#standup-form .card-body .links a').click
        find('form#standup-form .card-body .nested-fields input.form-control.input-lg')
          .set standup_text
        click_on 'Save'
      end

      # check for new value in the previous window without page refreshing
      expect do
        switch_to_window(windows.first)
        page.to have_text(standup_text)
      end

      visit root_path
    end
  end


end
