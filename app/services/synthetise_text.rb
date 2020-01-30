def synthesize_text text:
  # [START tts_synthesize_text]
  require "google/cloud/text_to_speech"

  client = Google::Cloud::TextToSpeech.new

  input_text = { text: text }

  # Note: the voice can also be specified by name.
  # Names of voices can be retrieved with client.list_voices
  voice = {
    language_code: "fr-FR",
    ssml_gender:   "FEMALE"
  }

  audio_config = { audio_encoding: "MP3" }

  response = client.synthesize_speech input_text, voice, audio_config

  # The response's audio_content is binary.
  File.open "output.mp3", "wb" do |file|
    # Write the response to the output file.
    file.write response.audio_content
  end

  puts "Audio content written to file 'output.mp3'"
  # [END tts_synthesize_text]
end

def synthesize_ssml ssml:
  # [START tts_synthesize_ssml]
  require "google/cloud/text_to_speech"

  client = Google::Cloud::TextToSpeech.new

  input_text = { ssml: ssml }

  # Note: the voice can also be specified by name.
  # Names of voices can be retrieved with client.list_voices
  voice = {
    language_code: "fr-FR",
    ssml_gender:   "FEMALE"
  }

  audio_config = { audio_encoding: "MP3" }

  response = client.synthesize_speech input_text, voice, audio_config

  # The response's audio_content is binary.
  File.open "output.mp3", "wb" do |file|
    # Write the response to the output file.
    file.write response.audio_content
  end

  puts "Audio content written to file 'output.mp3'"
  # [END tts_synthesize_ssml]
end

if $PROGRAM_NAME == __FILE__
  command = ARGV.shift
  text    = ARGV.shift

  if command == "text"
    synthesize_ssml ssml: text
  elsif command == "ssml"
    synthesize_text ssml: text
  else
    puts <<~USAGE
      Usage: ruby synthesize_text.rb (text TEXT | ssml SSML)

      Example:
        ruby synthesize_text.rb text "hello"
        ruby synthesize_text.rb ssml "<speak>Hello there.</speak>"
    USAGE
  end
end
