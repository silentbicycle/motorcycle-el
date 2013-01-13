;;; motorcycle.el --- motorcycle modeline madness
;;
;; This file is not part of Emacs. In fact, it's BSD licensed.
;;
;; Copyright (c) 2012, Scott Vokes <vokes.s@gmail.com>
;; All rights reserved.
;;
;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted provided that the following conditions
;; are met:
;;     * Redistributions of source code must retain the above copyright
;;       notice, this list of conditions and the following disclaimer.
;;     * Redistributions in binary form must reproduce the above
;;       copyright notice, this list of conditions and the following
;;       disclaimer in the documentation and/or other materials
;;       provided with the distribution.
;;     * Neither the name of the <ORGANIZATION> nor the names of its
;;       contributors may be used to endorse or promote products
;;       derived from this software without specific prior written
;;       permission.
;; 
;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;; "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;; LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
;; FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
;; COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
;; INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
;; BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
;; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
;; CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
;; LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
;; ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;; POSSIBILITY OF SUCH DAMAGE.
;;
;; Commentary:
;;     Just some silliness.
;;
;; Usage:
;;     M-x motorcycle
;;
;;     M-x motorcycle-park to stop.

(defvar *motorcycle-string* "o^o`")

(defvar *motorcycle-tick* 0)

(defun motorcycle-smoke (n)
  (case n
    (0 "Oo.....")
    (1 "OOo....")
    (2 "0oo....")
    (3 "Oooo...")))

(defun motorcycle-string ()
  "Look up the motorcycle string for the modeline."
  (concat " "
          (motorcycle-smoke *motorcycle-tick*)
          *motorcycle-string*
          " "))

(defun motorcycle-modeline ()
  "Assemble the motorcycle modeline string."
  (setf *motorcycle-tick*
        (mod (+ *motorcycle-tick* 1) 4))
  (motorcycle-string))
;; (motorcycle-modeline)

(defun motorcycle ()
  "Add a motorcycle to the modeline."
  (interactive)
  (let ((s '(:eval (motorcycle-modeline))))
    (unless (member s global-mode-string)
      (push s global-mode-string))))

(defun motorcycle-park ()
  "Park the motorcycle."
  (interactive)
  (let ((s '(:eval (motorcycle-modeline))))
    (when (member s global-mode-string)
      (setf global-mode-string
            (remove s global-mode-string)))))

(provide 'motorcycle)
