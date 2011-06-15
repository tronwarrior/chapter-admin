require 'spec_helper'

describe "tenants/edit.html.erb" do
  before(:each) do
    @tenant = assign(:tenant, stub_model(Tenant,
      :name => "MyString",
      :title => "MyString",
      :accounting_key => "MyString",
      :metadata => "MyString"
    ))
  end

  it "renders the edit tenant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tenants_path(@tenant), :method => "post" do
      assert_select "input#tenant_name", :name => "tenant[name]"
      assert_select "input#tenant_title", :name => "tenant[title]"
      assert_select "input#tenant_accounting_key", :name => "tenant[accounting_key]"
      assert_select "input#tenant_metadata", :name => "tenant[metadata]"
    end
  end
end
