extends Node

var frames = []

func _ready():
    load_frames()
    play_bad_apple()

func load_frames():
    var dir_path = "res://frames/" #Path to the frames directory
    var total_frames = 6572 #Total number of frames in animation
    for i in range(0, total_frames, 3):  #Skipping frames
        var file_name = dir_path + "frame_%04d.txt" % i # Making the file name
        if FileAccess.file_exists(file_name): 
            var file = FileAccess.open(file_name, FileAccess.READ) 
            frames.append(file.get_as_text()) #Getting the contents of the file as text
            file.close()
        else:
            printerr("Missing frame: " + file_name) #Error handling
            break #Stop loading if a frame is missing

func play_bad_apple():
    call_deferred("_play_loop") 

func _play_loop():
    for frame in frames:
        print(frame) #Printing the frames
        await get_tree().create_timer(0.09).timeout  #Delay