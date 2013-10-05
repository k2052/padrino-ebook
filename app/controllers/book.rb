PadrinoEbook.controllers :book do 
	before do
	  ## 
	  # Register Customer Kramdown renderer
	  #
	  ::Tilt.mappings.delete('md') # probably not the best idea to delete mappings but it works
	  ::KramdownExecutr.app = self
	  ::Tilt.register(KramdownExecutrTemplate, ".md")
	end

	get :sample_chapter, :map => "/sample-chapters/:chapter" do
		@toc_route = :sample_chapter
		@table_of_contents = recursively_enhance(YAML.load_file(File.join(Padrino.root, 'data/sample_toc.yml')))
		sample_chapter()
	end

	get :chapter, :map => "/book/:chapter" do
		@table_of_contents = recursively_enhance(YAML.load_file(File.join(Padrino.root, 'data/toc.yml')))
		chapter()
	end
end
