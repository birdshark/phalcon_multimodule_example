<?php

namespace Application\Common\Models;

use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;

class PasswordResets extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var string
     * @Column(column="email", type="string", length=255, nullable=false)
     */
    public $email;

    /**
     *
     * @var string
     * @Column(column="token", type="string", length=255, nullable=false)
     */
    public $token;

    /**
     *
     * @var string
     * @Column(column="created_at", type="string", nullable=false)
     */
    public $created_at;

    /**
     * Validations and business logic
     *
     * @return boolean
     */
    public function validation()
    {
        $validator = new Validation();

        $validator->add(
            'email',
            new EmailValidator(
                [
                    'model'   => $this,
                    'message' => 'Please enter a correct email address',
                ]
            )
        );

        return $this->validate($validator);
    }

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("test");
        $this->setSource("password_resets");
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'password_resets';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return PasswordResets[]|PasswordResets|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return PasswordResets|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
