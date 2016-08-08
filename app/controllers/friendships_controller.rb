class FriendshipsController < ApplicationController
	def create
		@user = current_user
		@friend = User.find(params[:friend_id])
		@friendship1 = Friendship.new(:user => @user, :friend => @friend, :status => 'requested')
		@friendship2 = Friendship.new(:user => @friend, :friend => @user, :status => 'pending')
		if @friendship1.save && @friendship2.save
			flash[:success] = "Invitation to #{@friend.email} was sent successfuly!"
		else
			flash[:danger] = "An error occured"
		end
		redirect_to users_path
	end

	def update
		@user = current_user
		@friend = Friendship.find(params[:id]).friend
		@friendship1 = Friendship.where(user_id: @user.id, friend_id: @friend.id, status: "pending")
		@friendship2 = Friendship.where(user_id: @friend.id, friend_id: @user.id, status: "requested")
		if @friendship1.update_all(:status => "accepted") && @friendship2.update_all(:status => "accepted")
			flash[:success] = "Invitation from #{@friend.email} was accepted!"
		else
			flash[:danger] = "An error occured"
		end
		redirect_to users_path
	end

	def destroy
		@user = current_user
		@friend = Friendship.find(params[:id]).friend
		@friendship1 = Friendship.where(user_id: @user.id, friend_id: @friend.id).delete_all
		@friendship2 = Friendship.where(user_id: @friend.id, friend_id: @user.id).delete_all
		#@friendship1.delete_all
		#@friendship2.delete_all
		flash[:success] = "Invitation from #{@friend.email} was removed"
		redirect_to users_path
	end
end
