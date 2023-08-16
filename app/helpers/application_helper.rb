module ApplicationHelper
    def data_br(data_us)
        data_us.strftime("%d/%m/%Y")
    end

    def environment_type
        if Rails.env.development?
            "You're on a development ambient"
        elsif Rails.env.production?
            "You're on a production ambient"
        else
            "You're on a test ambient"
        end
    end          
end
