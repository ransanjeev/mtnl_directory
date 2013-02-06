namespace :directory do

	desc "MTNL Directory" 
	task :mtnl_delhi=> :environment do
		DirectoryEntry.all.each do |entry|
	    loader = Soulmate::Loader.new('directoryentry')
	    loader.add('term'=>"#{entry.name} #{entry.address}", 'id'=> entry.id)
	  end
	end
end