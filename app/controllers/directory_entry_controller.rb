class DirectoryEntryController < ApplicationController
	respond_to :html, :json 
  def index
		respond_with(DirectoryEntry.user_index('term'))
  end

  def autocomplete_person_name
  	respond_with(DirectoryEntry.search(params['term']))
  end
end
