extends Node

var frames = []

func _ready():
    load_frames()
    play_bad_apple()

func load_frames():
    var dir_path = "res://frames/"
    var total_frames = 6572
    for i in range(0, total_frames, 3):  # Skipping every other frame
        var file_name = dir_path + "frame_%04d.txt" % i
        if FileAccess.file_exists(file_name):
            var file = FileAccess.open(file_name, FileAccess.READ)
            frames.append(file.get_as_text())
            file.close()
        else:
            push_error("Missing frame: " + file_name)

func play_bad_apple():
    call_deferred("_play_loop")

func _play_loop():
    for frame in frames:
        print(frame)
        await get_tree().create_timer(0.09).timeout  # ~20 FPS