module RequestHelper
  def request_status request, result = t("approved")
    result = t("un_approve") unless request.approve
    result
  end
  def delete_toggle request
    if request.class.name == ClubRequest.name
      link_to user_club_request_path(user_id: current_user.id, id: request.id),
       remote: true, method: :delete, class: "btn btn-danger" do
        "<i class='fa fa-times'></i>".html_safe
      end
    else
      link_to user_organization_request_path(user_id: current_user.id, id: request.id),
       remote: true, method: :delete, class: "btn btn-danger" do
        "<i class='fa fa-times'></i>".html_safe
      end
    end
  end
end
