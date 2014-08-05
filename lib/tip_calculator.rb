require 'json'

class TipCalculator
  def initialize(path_to_sales_data, path_to_staff_data)
    @sales_hash = JSON.parse(File.read(path_to_sales_data))
    @staff_hash = JSON.parse(File.read(path_to_staff_data))
  end

  def tips_for_date(date)
    h = {}
    @staff_hash.each do |server|
      sales_for(date).each do |sales|
        if server["job_title"] == "server" && sales["server_id"] == server["id"]
          if h.has_key?(server["first_name"] + " " + server["last_name"])
            h[server["first_name"] + " " + server["last_name"]] += sales["tip"]
          else
            h[server["first_name"] + " " + server["last_name"]] = sales["tip"]
          end
        end
      end
    end
    result = {}
    h.each do |k, v|
      result[k] = "$%.2f" % (v/100.0)
    end
    result
  end

  def sales_for(date)
    @sales_hash.map { |sale| sale if sale["date"] == date }.compact
  end

end