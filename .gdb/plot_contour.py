# Save this as plot_contour.py and source it in gdb with: source plot_contour.py
import gdb
import numpy as np
import matplotlib.pyplot as plt


class ContourPlotCommand(gdb.Command):
    """Plot a 2D array as a contour plot.

    Usage: plot-contour <expr> <rows> <cols>
    Example: plot-contour my_array 100 200
    """

    def __init__(self):
        super(ContourPlotCommand, self).__init__("plot-contour", gdb.COMMAND_DATA)

    def invoke(self, arg, from_tty):
        args = gdb.string_to_argv(arg)
        if len(args) != 3:
            print("Usage: plot-contour <expr> <rows> <cols>")
            return

        expr, rows, cols = args[0], args[1], args[2]

        # Evaluate array expression in GDB
        args = []
        for arg in [expr, rows, cols]:
            try:
                arg = gdb.parse_and_eval(arg)
                args.append(arg)
            except gdb.error as e:
                print("Error evaluating expression:", e)
                return

        print(args)
        val, rows, cols = args

        # Cast to pointer to double
        try:
            val = val.cast(gdb.lookup_type("double").pointer())
        except gdb.error:
            print("Error: Only works with double arrays (change cast if needed).")
            return

        # Extract into numpy array
        data = np.zeros((rows, cols))
        for i in range(rows):
            for j in range(cols):
                data[i, j] = float(val[i * cols + j])

        # Make a contour plot
        plt.figure()
        X, Y = np.meshgrid(np.arange(cols), np.arange(rows))
        cp = plt.contourf(X, Y, data, cmap="viridis")
        plt.colorbar(cp)
        plt.title("Contour Plot from GDB Array")
        plt.xlabel("Column index")
        plt.ylabel("Row index")
        plt.show()


# Register the command with gdb
ContourPlotCommand()
