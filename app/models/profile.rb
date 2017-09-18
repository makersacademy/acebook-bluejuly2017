
class Profile < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "interests"
      t.string "bio_short"
      t.string "bio_long"
      t.string "dob"
      t.integer "pic-id"
      t.timestamps
    end
  end
end

def new_profile(**fields)
  profile = Profile.create(**fields)
  profile.save
end

def get_profile(**fields)
  profile = Profile.find_by(**fields)
  raise "could not find profile with fields #{fields}" if profile.nil?
  return profile
end

def update_profile(profile_id, **fields)
  profile = get_profile(id: profile_id)
  raise "#{profile_id} is not a valid profile id" if profile.nil?
  profile.update(**fields)
  profile.save
end

def delete_profile(profile_id)
  profile = get_profile(id: profile_id)
  raise "#{profile_id} is not a valid profile id" if profile.nil?
  profile.destroy
end
