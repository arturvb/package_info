require 'net/http'

class PackagesController < ApplicationController

  def health
    package = Package.find_by_name(params[:packagename])

    if package
      if params[:version]
        version = package.versions.where(name: params[:version])
      else
        version = package.versions.last
      end

      unless version
        return render json: { error: "Not Found" }, status: 404
      end

      render json: { name: package.name, version: version.name,
                     license: package.license, vulnerabilities: version.vulnerabilities },
             status: 200
    else
      render json: { error: "Not Found" }, status: 404
    end
  end


  def releases
    uri = URI("https://registry.npmjs.org/#{params[:packagename]}")
    response = Net::HTTP.get_response(uri)

    if response.code.to_i != 200
      render json: response.body, status: response.code.to_i
    else

      body = JSON.parse(response.body)
      name = body['name']
      versions = body['versions'].keys
      latest = nil

      latest_t = 0
      versions.each do |v|
        current_t = DateTime.parse(body['time'][v]).to_i
        if current_t > latest_t
          latest_t = current_t
          latest = v
        end
      end

      render json: {name: name, latest: latest, releases: versions }, status: 200
    end

  end

end
