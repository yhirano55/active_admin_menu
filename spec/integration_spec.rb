require "spec_helper"

describe "integration test", type: :feature do
  before { visit admin_root_path }

  subject { page }

  it "should have expected menu" do
    within "ul.header-item#tabs" do
      should     have_link "Dashboard", href: admin_dashboard_path
      should     have_link "People",    href: admin_people_path
      should     have_link "Posts",     href: admin_posts_path
      should     have_link "Books",     href: admin_books_path
      should_not have_link "Friends",   href: admin_friends_path
    end

    should have_css "ul.header-item#tabs > li#people"
    should have_css "ul.header-item#tabs > li#admin ul li#posts"
    should have_css "ul.header-item#tabs > li#content ul li#books"
  end
end
