extern int* devices;
extern int devicecount_cache;
void camoramic_v4l2util_init();
void camoramic_v4l2util_reload();
char *camoramic_v4l2util_get_format(int device, int ccaps);
char *camoramic_v4l2util_get_friendly_name(int device);
char *camoramic_v4l2util_device_to_string(int device);
char *camoramic_v4l2util_get_human_string_caps(int device, int ccaps);
int camoramic_v4l2util_get_device_count();
int camoramic_v4l2util_get_caps_count(int device);
int camoramic_v4l2util_get_caps_framerate(int device, int ccaps);
GstCaps *camoramic_v4l2util_get_caps(int device, int ccaps);
