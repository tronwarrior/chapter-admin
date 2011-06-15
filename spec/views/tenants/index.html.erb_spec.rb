require 'spec_helper'

describe "tenants/index.html.erb" do
  before(:each) do
    assign(:tenants, [
      stub_model(Tenant,
        :name => "Name",
        :title => "Title",
        :accounting_key => "Accounting Key",
        :metadata => "Metadata"
      ),
      stub_model(Tenant,
        :name => "Name",
        :title => "Title",
        :accounting_key => "Accounting Key",
        :metadata => "Metadata"
      )
    ])
  end

  it "renders a list of tenants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Accounting Key".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Metadata".to_s, :count => 2
  end
end
