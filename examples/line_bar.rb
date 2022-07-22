# require 'SVG/Graph/Bar'
#
# require "SVG/Graph/LineBar"

x_axis = ['1-10', '10-30', '30-50', '50-70', 'older']

options = {
  :width             => 640,
  :height            => 500,
  :stack             => :side,  # the stack option is valid for Bar graphs only
  :fields            => x_axis,
  :graph_title       => "kg per head and year chocolate consumption",
  :show_graph_title  => true,
  :scale_integers    => true,
  :show_x_title      => true,
  :x_title           => 'Age in years',
  :stagger_x_labels => true,
  :rotate_x_labels   => true,
  :x_title_location  => :end,
  :show_y_title      => true,
  :y_title           => 'kg/year',
  :y_title_location  => :end,
  :add_popups        => true,
  :no_css            => true,
  # :x_axis_position   => 0,
  # :y_axis_position   => '30-50',
}

data1 = [15, 4, 6.7, 4, 2.8]
data2 = [1, 5, 4, 5, 12.7]
data3 = [ 4, 5, 6, 2, 3]

g = SVG::Graph::LineBar.new(options)

g.add_data( {
    :data => data1,
    :title => "Dataset1"
  })
g.add_data( {
    :data => data2,
    :title => "Dataset2"
  })

g.add_data({
   :data => data3,
   :title => "Dataset3",
   :render_as => "line"
})
# graph.burn            # this returns a full valid xml document containing the graph
# graph.burn_svg_only   # this only returns the <svg>...</svg> node
output_filename = File.basename(__FILE__, ".rb")

# if defined?(USE_FOR_TESTING)
#   File.open(File.join(OUTPUT_FOLDER, "#{output_filename}.html"), "w") {|f| f.write(g.burn)}
# else
  File.open(File.expand_path("#{output_filename}.svg",__dir__), 'w') {|f| f.write(g.burn_svg_only)} # for inclusion into readme.md
# end
