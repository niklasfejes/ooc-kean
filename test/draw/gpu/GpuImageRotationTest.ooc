/* This file is part of magic-sdk, an sdk for the open source programming language magic.
 *
 * Copyright (C) 2016 magic-lang
 *
 * This software may be modified and distributed under the terms
 * of the MIT license.  See the LICENSE file for details.
 */

use base
use geometry
use draw-gpu
use draw
use opengl
use unit

GpuImageRotationTest: class extends Fixture {
	init: func {
		super("GpuImageRotationTest")
		sourceImage := RasterRgba open("test/draw/gpu/input/Flower.png")
		focalLength := 500.0f
		smallRotation := 10.0f toRadians()
		flipRotation := 180.0f toRadians()
		this add("GPU rotation flip X (RGBA)", func {
			correctImage := RasterRgba open("test/draw/gpu/correct/rotation_flip_rgba_X.png")
			gpuImage := gpuContext createRgba(sourceImage size)
			gpuImage canvas clear()
			gpuImage canvas transform = FloatTransform3D createRotationX(flipRotation)
			gpuImage canvas draw(sourceImage)
			rasterFromGpu := gpuImage toRaster()
			expect(rasterFromGpu distance(correctImage), is equal to(0.0f))
		})
		this add("GPU rotation flip Y (RGBA)", func {
			correctImage := RasterRgba open("test/draw/gpu/correct/rotation_flip_rgba_Y.png")
			gpuImage := gpuContext createRgba(sourceImage size)
			gpuImage canvas clear()
			gpuImage canvas transform = FloatTransform3D createRotationY(flipRotation)
			gpuImage canvas draw(sourceImage)
			rasterFromGpu := gpuImage toRaster()
			expect(rasterFromGpu distance(correctImage), is equal to(0.0f))
		})
		this add("GPU rotation flip Z (RGBA)", func {
			correctImage := RasterRgba open("test/draw/gpu/correct/rotation_flip_rgba_Z.png")
			gpuImage := gpuContext createRgba(sourceImage size)
			gpuImage canvas clear()
			gpuImage canvas transform = FloatTransform3D createRotationZ(flipRotation)
			gpuImage canvas draw(sourceImage)
			rasterFromGpu := gpuImage toRaster()
			expect(rasterFromGpu distance(correctImage), is equal to(0.0f))
		})
		this add("GPU rotation small X (RGBA)", func {
			correctImage := RasterRgba open("test/draw/gpu/correct/rotation_small_rgba_X.png")
			gpuImage := gpuContext createRgba(sourceImage size)
			gpuImage canvas pen = Pen new(ColorRgba new())
			gpuImage canvas clear()
			gpuImage canvas focalLength = focalLength
			gpuImage canvas transform = FloatTransform3D createRotationX(smallRotation)
			gpuImage canvas draw(sourceImage)
			rasterFromGpu := gpuImage toRaster()
			expect(rasterFromGpu distance(correctImage), is equal to(0.0f) within(0.005f))
		})
		this add("GPU rotation small Y (RGBA)", func {
			correctImage := RasterRgba open("test/draw/gpu/correct/rotation_small_rgba_Y.png")
			gpuImage := gpuContext createRgba(sourceImage size)
			gpuImage canvas pen = Pen new(ColorRgba new())
			gpuImage canvas clear()
			gpuImage canvas focalLength = focalLength
			gpuImage canvas transform = FloatTransform3D createRotationY(smallRotation)
			gpuImage canvas draw(sourceImage)
			rasterFromGpu := gpuImage toRaster()
			expect(rasterFromGpu distance(correctImage), is equal to(0.0f) within(0.05f))
		})
		this add("GPU rotation small Z (RGBA)", func {
			correctImage := RasterRgba open("test/draw/gpu/correct/rotation_small_rgba_Z.png")
			gpuImage := gpuContext createRgba(sourceImage size)
			gpuImage canvas pen = Pen new(ColorRgba new())
			gpuImage canvas clear()
			gpuImage canvas focalLength = focalLength
			gpuImage canvas transform = FloatTransform3D createRotationZ(smallRotation)
			gpuImage canvas draw(sourceImage)
			rasterFromGpu := gpuImage toRaster()
			expect(rasterFromGpu distance(correctImage), is equal to(0.0f))
		})
	}
}
gpuContext := OpenGLContext new()
GpuImageRotationTest new() run() . free()
gpuContext free()
