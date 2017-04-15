require 'rails_helper'

describe 'members/index' do
  before(:each) do
    assign(:q, Member.ransack(nil))
    assign(:members, Kaminari.paginate_array([
      FactoryGirl.create(:member, last_name: 'Doe', first_name: 'John'),
      FactoryGirl.create(:member, last_name: 'Doe', first_name: 'Jane')
    ]).page())
    allow(controller).to receive(:current_user).and_return(Member.new)

  end

  it 'renders a list of members' do
    render
    assert_select 'tr>td', text: 'Doe', count: 2
    assert_select 'tr>td', text: 'John', count: 1
    assert_select 'tr>td', text: 'Jane', count: 1
  end
end
