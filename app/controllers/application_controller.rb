class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_movies_path
    when Member
      root_path
    end
  end
  
  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path
    when :member
      root_path
    end
  end
  
  def ensure_correct_member
      if params[:id] != nil && (current_member.id != params[:id].to_i)
        flash[:notice] = "権限がありません。"
        redirect_to root_path
      end
  end  
end
