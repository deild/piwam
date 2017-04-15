require 'rails_helper'

RSpec.describe 'expenses/index', type: :view do
  before(:each) do
    #assign(:expenses, [
    #    FactoryGirl.create(:expense, date: '2015-02-18', amount: 10.00, paid: true),
    #    FactoryGirl.create(:expense, date: '2015-02-20', amount: 10.00, paid: false)
    #])
    FactoryGirl.create(:expense, date: '2015-02-18', amount: 10.00, paid: true)
    FactoryGirl.create(:expense, date: '2015-02-20', amount: 10.00, paid: false)
    #assign(:expenses, FactoryGirl.create(:expense, date: '2015-02-18', amount: 10.00, paid: true) )
    #expense = FactoryGirl.create(:expense, date: '2015-02-20', amount: 10.00, paid: false)
    allow(controller).to receive(:current_user).and_return(Member.new)
  end

  it 'renders a list of expenses' do
    render
    assert_select 'tr>td', text: '18/02/2015', count: 1
    assert_select 'tr>td', text: 'Non payée', count: 1
    assert_select 'tr>td', text: '10,00 €', count: 2
  end
end
