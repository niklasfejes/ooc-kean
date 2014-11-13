/*
* Copyright (C) 2014 - Simon Mika <simon@mika.se>
*
* This sofware is free software; you can redistribute it and/or
* modify it under the terms of the GNU Lesser General Public
* License as published by the Free Software Foundation; either
* version 2.1 of the License, or (at your option) any later version.
*
* This software is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public License
* along with this software. If not, see <http://www.gnu.org/licenses/>.
*/

import lang/Memory
import structs/FreeArrayList
import threading/Thread
import ReferenceCounter

ByteBufferAbstract: abstract class {
	_referenceCount: ReferenceCounter
	size: Int
	pointer: UInt8*
	copy: abstract func -> This
	increaseReferenceCount: func {
		this _referenceCount increase()
	}
	decreaseReferenceCount: func {
		this _referenceCount decrease()
	}
}