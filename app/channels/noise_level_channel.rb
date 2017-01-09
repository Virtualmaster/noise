class NoiseLevelChannel < ApplicationCable::Channel
  def subscribed
    stream_from "noise_level"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def run_noise_script(data)
    system("python #{Rails.root.join("misc", "sound_analyzer.py").to_s} &")
  end
   
  def new_value(data)
    ActionCable.server.broadcast('noise_level', level: data["value"])
  end
end
