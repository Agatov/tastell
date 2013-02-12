class StatsReport < Prawn::Document

  Widths = [140.0, 100.0, 140.0]
  Headers = ['Date', 'Hosts', 'Hits']

  def to_pdf
    text 'Weekly auto generated report', :size => 15, :style => :bold, :align => :center
    move_down 20

    table([
        Headers,
        *get_stats_rows
    ], header: true, row_colors: %w[efefef ffffff], column_widths: Widths,
       cell_style: {border_width: 0.5, border_color: 'aaaaaa', size: 9, text_color: '333333'}
    ) do
      row(0).style background_color: '333333', text_color: 'ffffff', size: 14
    end

    render
  end

  def get_stats_rows
    PlaceDailyView.order('id desc').map {|pdl| [pdl.date.strftime('%Y-%m-%d'), pdl.hosts_count, pdl.hits_count]}
  end


  def generate_pdf
    File.open(Rails.root.join('public', 'report.pdf'), 'wb') do |f|
      f.write(to_pdf)
    end
    puts '|Done|'
  end

end