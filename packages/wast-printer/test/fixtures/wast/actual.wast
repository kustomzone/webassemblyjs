(module
  (import "module" "name" (func $name (param i32) (result i32)))
  (import "m" "a" (global (mut i32)))
  (import "m" "a" (global i32))
  (import "a" "b" (table 1 anyfunc))
  (import "c" "d" (table 5 25 anyfunc))

  (global $test i32 (i32.const 0))
  (global i32 (i32.const 1_1_4))
  (global (mut i32) (i32.const 1))

  (memory 1)
  (memory 1 0)
  (memory $foo 1 0)

  (type (func))
  (type $t (func))
  (type (func (param i32)))
  (type (func (param $x i32)))
  (type (func (result i32)))
  (type (func (param i32) (result i32)))
  (type (func (param $x i32) (result i32)))
  (type (func (param f32 f64)))

  (func $add (param $lhs i32) (param $rhs i32) (result i32)
    (local i32)
    (local i64)
    (local f32)
    (local f64)

    (local $a i32)
    (local $b f32)

    (get_local $lhs)
    (get_local $rhs)
    (i32.add)
    (return (i32.const 1))
    (return)

    (block)
    (block $foo)
    (block $test (result i32))
    (block
      (nop)
    )

    (call $a)
    (call 1)

    (loop)
    (loop $l)
    (loop
      (nop)
    )
    (loop (result i32)
      (nop)
      (nop)
    )

    (if (get_local 0)
      (then)
    )
    (if (get_local 0)
      (then)
      (else)
    )
    (if $l (get_local 0)
      (then)
    )
    (if $l (get_local 0)
      (then)
      (else)
    )
    (if (get_local 0)
      (then
        (nop)
      )
      (else
        (nop)
      )
    )

    (if (result i32) (get_local 0)
      (then
        (i32.const 7)
      )
      (else
        (i32.const 8)
      )
    )

    (i64.const -1)
    (i64.const 1)
    (i64.const 0xFF)

    (f32.const 0x1.b7p-1)
    (f32.const inf)
    (f32.const -inf)

    (call_indirect (i32.const 0))
    (call_indirect (param i64) (i64.const 0) (i32.const 0))
    (call_indirect (result i32) (i32.const 0))
    (call_indirect (type $baaa) (i32.const 16))
  )

  ;; a
  (; b ;)

  (export "add" (func $add))

  (table "a" 10 anyfunc)
  (table "b" 0 10 anyfunc)
  (table 10 anyfunc)
  (table 0 10 anyfunc)
  (table 0 anyfunc)
  (table $a 10 anyfunc)

  (func)
  (func $test)

  (func (type $t))
  (func (type 0))

  (start $test)
  (start 0)

  (elem (offset (i32.const 0)))
  (elem (offset (i32.const 0)) $f $f)
  (elem $t (i32.const 0))
  (elem $t (i32.const 0) $f $f)
  (elem $t (offset (i32.const 0)))
  (elem $t (offset (i32.const 0)) $f $f)

  (data (i32.const 25) "abc")
  (data 1 (i32.const 25) "abc")
)
