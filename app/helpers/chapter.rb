PadrinoEbook.helpers do
	def sample_chapter
		begin 
			render "book/samples/#{params[:chapter]}.md", :layout_engine => :slim, :layout => :book
		rescue Exception => e
			status 404
			render "errors/404"
		end
	end
	
	def chapter
		begin 
			render "book/#{params[:chapter]}.md", :layout_engine => :slim, :layout => :book
		rescue Exception => e
			status 404
			render "errors/404"
		end
	end
end
