import os
import vim
import threading

# struct js_event {
#         __u32 time;     /* event timestamp in milliseconds */
#         __s16 value;    /* value */
#         __u8 type;      /* event type */
#         __u8 number;    /* axis/button number */
# };

def worker():
	# Size of js_event struct defined in linux/joystick.h
	SIZEOF_JS_EVENT = 64
	JS_EVENT_BUTTON = 0x01
	JS_EVENT_AXIS	= 0x02
	
	fd = os.open('/dev/input/js0', os.O_RDONLY)
	
	
	while True:
		bs = os.read(fd, SIZEOF_JS_EVENT)
		# time = int.from_bytes(bs[0:4], byteorder='little', signed = False)
		value = int.from_bytes(bs[4:6], byteorder='little', signed = True)
		ty = int(bs[6])
		number = int(bs[7])
		
		if ty == JS_EVENT_BUTTON and value > 0:
			f = vim.Function('joystick#button')
			f(number)
	
		if ty == JS_EVENT_AXIS:
			f = vim.Function('joystick#axis')
			f(number, value)
	
	os.close(fd)

t = threading.Thread(target=worker)
t.daemon = True
t.start()
