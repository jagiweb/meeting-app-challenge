class DashboardController < ApplicationController

    def index
        @users = User.all
        @user_total_messages = @users.map{ |user| [user.name, user.messages.count]}
        @average_per_users = @users.map{|user| [user.name, user_avg_contribution(user)] }
        @user_most_least_contributions = @users.sort { |a,b| b.messages.count <=> a.messages.count}
    end

    def filtered_users
        @selected_users = params[:user][:ids].delete_if {|element| element == ""}
        @selected_users = User.find(@selected_users)
        @user_total_messages = @selected_users.map{ |user| [user.name, user.messages.count]}
        @average_per_users = @selected_users.map{|user| [user.name, user_avg_contribution(user)] }
        @user_most_least_contributions = @selected_users.sort { |a,b| b.messages.count <=> a.messages.count}
    end

    def user_avg_contribution(user)
        msg_durations = user.messages.map { |msg| msg.duration_in_sec }
        average_in_sec = msg_durations.sum / msg_durations.count
        average_in_sec.round(2)
    end

end
