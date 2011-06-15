require 'spec_helper'

describe "tenants/show.html.erb" do
  before(:each) do
    @tenant = assign(:tenant, stub_model(Tenant,
      :name => "Name",
      :title => "Title",
      :accounting_key => "Accounting Key",
      :metadata => "Metadata"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Accounting Key/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Metadata/)
  end
end
