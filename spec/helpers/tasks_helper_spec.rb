require 'rails_helper'

RSpec.describe TasksHelper, type: :helper do
  it 'returns "TODAY" for today deadline' do
    expect(helper.format_date_time(Date.today)).to eq("TODAY")
  end

  it 'returns "TOMORROW" for tomorrow deadline' do
    expect(helper.format_date_time(Date.tomorrow)).to eq("TOMORROW")
  end

  it 'return formatted deadline' do
    expect(helper.format_date_time("2118-02-28".to_date)).to eq ("Monday 28.02.2118")
  end
end
