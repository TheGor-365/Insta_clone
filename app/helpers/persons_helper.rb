module PersonsHelper

  def profile_picture person, width = 100
    image_path = person.image.present? ? person.image.url : 'profile.jpg'
    image_tag(image_path, width: width, class: 'img-circle m-r-10')
  end

  def can_edit_profile? profile_id
    person_signed_in? && current_person.id == profile_id
  end

end
