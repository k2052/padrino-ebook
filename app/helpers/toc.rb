PadrinoEbook.helpers do
	## Methods for helping with TOC
	def get_current_position_in_toc()
		@toc_route ||= :chapter
		route = @toc_route
		toc = @table_of_contents
		toc.each_with_index do |chapter, index|
	     if current_page?(:book, route, :chapter => "#{chapter.title.parameterize}")
		     return index
	     end
		end
	end

	def prev_chapter_link(toc=nil)
		@toc_route ||= :chapter
		route = @toc_route
		prev = @table_of_contents[get_current_position_in_toc() - 1]
		link = url(:book, route, :chapter => "#{prev.title.parameterize}")
		return link
	end

	def next_chapter_link(toc=nil)
		@toc_route ||= :chapter
		route = @toc_route
		toc = @table_of_contents
		next_page = toc[get_current_position_in_toc() + 1]
		link = url(:book, route, :chapter => "#{next_page.title.parameterize}")
		return link
	end

	def current_toc_pos_first?
		return true if @book_index
		return true if get_current_position_in_toc() == 0
	end

	def current_toc_pos_last?(toc=nil)
		toc = @table_of_contents
		return true if toc[get_current_position_in_toc()] == toc[-1]
	end
end
