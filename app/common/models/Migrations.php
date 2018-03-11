<?php

namespace Application\Common\Models;

class Migrations extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var string
     * @Column(column="migration", type="string", length=255, nullable=false)
     */
    public $migration;

    /**
     *
     * @var integer
     * @Column(column="batch", type="integer", length=11, nullable=false)
     */
    public $batch;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("test");
        $this->setSource("migrations");
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'migrations';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Migrations[]|Migrations|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Migrations|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
