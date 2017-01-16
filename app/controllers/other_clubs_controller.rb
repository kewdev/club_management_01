class OtherClubsController < ApplicationController
  def index
    clubs_organizations = Club.of_organization current_user.organizations
    @other_clubs = clubs_organizations.not_in current_user.clubs
  end
end




