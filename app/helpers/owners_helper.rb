module OwnersHelper

  def profile_picture owner, width = 100
    image_path = owner.image.present? ? owner.image.url : 'profile.jpg'
    image_tag(image_path, width: width, class: 'img-circle m-r-10')
  end

  def can_edit_profile? profile_id
    owner_signed_in? && current_owner.id == profile_id
  end

end
