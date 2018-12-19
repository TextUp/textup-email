require "premailer"

# Based on https://github.com/premailer/premailer
# Uses Jekyll Hooks, documented at: https://jekyllrb.com/docs/plugins/hooks/

Jekyll::Hooks.register :site, :post_write do |site|
    output_index = site.pages.index { |page| page.name == "index.html" }
    if output_index != nil
        output_page = site.pages[output_index]
        output_root_dir = site.dest
        output_path = output_page.destination(output_root_dir)

        premailer = Premailer.new(output_path, { :warn_level => Premailer::Warnings::RISKY })
        # Write the HTML output
        File.open(File.join(output_root_dir, "index-inlined.html"), "w") do |file_stream|
          file_stream.puts premailer.to_inline_css
        end
        # Output any CSS warnings
        puts "******** Start premailer warnings ********"
        premailer.warnings.each do |w|
          puts "#{w[:message]} (#{w[:level]}) may not render properly in #{w[:clients]}"
        end
        puts "********* End premailer warnings *********"
    end
end
