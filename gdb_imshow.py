import gdb
import numpy as np
import matplotlib.pyplot as plt
import argparse
import shlex

class ImshowCommand(gdb.Command):
    """
    Display a memory buffer as a 2D image using Matplotlib.
    Usage: imshow <address> <nx> <ny> [--stride S] [--dtype T]

    Example: imshow my_ptr 640 480 --stride 1 --dtype float
    """

    def __init__(self):
        super(ImshowCommand, self).__init__("imshow", gdb.COMMAND_DATA)

    def invoke(self, arg, from_tty):
        # Parse arguments using shlex to handle spaces/quotes and argparse for logic
        args = shlex.split(arg)
        parser = argparse.ArgumentParser(prog="imshow")
        parser.add_argument("address", help="Starting address or variable name")
        parser.add_argument("nx", help="Width (number of columns)")
        parser.add_argument("ny", help="Height (number of rows)")
        parser.add_argument("--stride", type=int, default=1, help="Element stride (default: 1)")
        parser.add_argument("--dtype", default="double", choices=["int", "float", "double"],
                            help="Data type (default: double)")
        parser.add_argument("--cmap", default="viridis",
                            help="Colormap to use (default: viridis)")
        parser.add_argument("--vmin", type=float, default=None,
                            help="Lower limit for colormap (default: img.min())")
        parser.add_argument("--vmax", type=float, default=None,
                            help="Upper limit for colormap (default: img.max())")

        try:
            parsed = parser.parse_args(args)
        except SystemExit:
            return

        parsed.nx = int(gdb.parse_and_eval(parsed.nx))
        parsed.ny = int(gdb.parse_and_eval(parsed.ny))

        # Map string types to numpy dtypes and sizes
        type_map = {
                "int": (np.int32, 4),
                "float": (np.float32, 4),
                "double": (np.float64, 8)
                }
        np_dtype, item_size = type_map[parsed.dtype]

        # Calculate memory requirements
        # We read (nx * ny * stride) elements
        total_elements = parsed.nx * parsed.ny * parsed.stride
        total_bytes = total_elements * item_size

        # Resolve address
        try:
            addr_val = gdb.parse_and_eval(parsed.address)
            # Ensure we have the actual numeric address
            addr = int(addr_val.cast(gdb.lookup_type("unsigned long")))
        except gdb.error as e:
            print(f"Error resolving address: {e}")
            return

        # Read memory from the inferior process
        try:
            inferior = gdb.selected_inferior()
            mem = inferior.read_memory(addr, total_bytes)
        except gdb.error as e:
            print(f"Error reading memory: {e}")
            return

        # Convert to numpy array
        data = np.frombuffer(mem, dtype=np_dtype)

        # Apply stride if necessary
        if parsed.stride > 1:
            data = data[::parsed.stride]

        # Ensure the data matches the expected dimensions
        if data.size < (parsed.nx * parsed.ny):
            print(f"Error: Buffer size ({data.size}) is smaller than nx * ny ({parsed.nx * parsed.ny})")
            return

        # Reshape to 2D
        # Note: imshow expects (rows, cols), which corresponds to (ny, nx)
        img = data[:parsed.nx * parsed.ny].reshape((parsed.ny, parsed.nx))

        # Visualize
        plt.figure(figsize=(8, 6))
        plt.title(f"GDB Memory: {parsed.address} ({parsed.nx}x{parsed.ny})")
        vmin = parsed.vmin if parsed.vmin is not None else img.min()
        vmax = parsed.vmax if parsed.vmax is not None else img.max()
        plt.imshow(img, cmap=parsed.cmap, vmin=vmin, vmax=vmax)
        plt.colorbar()
        plt.savefig('img.png')
        plt.show()

# Register the command
ImshowCommand()
